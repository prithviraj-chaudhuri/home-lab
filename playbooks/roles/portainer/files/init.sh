#!/bin/sh
set -e

PORTAINER_URL="http://portainer:9000"

echo "Installing curl/jq..."
apk add --no-cache curl jq > /dev/null 2>&1

echo "Waiting for Portainer to be ready..."
until curl -sf "$PORTAINER_URL/api/status" > /dev/null; do
  sleep 2
done

# Check if admin is already initialized
STATUS=$(curl -sf "$PORTAINER_URL/api/status" | jq -r '.Authentication')
if [ "$STATUS" = "true" ]; then
  echo "Portainer already initialized, skipping..."
  # Still try to re-apply OAuth in case it's not set
fi

# Initialize admin user if not yet set up
echo "Initializing admin user..."
INIT_RESP=$(curl -sf -X POST "$PORTAINER_URL/api/users/admin/init" \
  -H "Content-Type: application/json" \
  -d "{\"Username\":\"admin\",\"Password\":\"$PORTAINER_ADMIN_PASSWORD\"}" || true)

# Get JWT token
echo "Logging in..."
TOKEN=$(curl -sf -X POST "$PORTAINER_URL/api/auth" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"admin\",\"password\":\"$PORTAINER_ADMIN_PASSWORD\"}" \
  | jq -r '.jwt')

if [ -z "$TOKEN" ] || [ "$TOKEN" = "null" ]; then
  echo "ERROR: Failed to obtain auth token. Check admin credentials."
  exit 1
fi

echo "Applying GitHub OAuth settings..."
curl -sf -X PUT "$PORTAINER_URL/api/settings" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d "{
    \"AuthenticationMethod\": 3,
    \"OAuthSettings\": {
      \"ClientID\": \"$GITHUB_CLIENT_ID\",
      \"ClientSecret\": \"$GITHUB_CLIENT_SECRET\",
      \"AuthorizationURI\": \"https://github.com/login/oauth/authorize\",
      \"AccessTokenURI\": \"https://github.com/login/oauth/access_token\",
      \"ResourceURI\": \"https://api.github.com/user\",
      \"RedirectURI\": \"https://portainer.prithvirajchaudhuri.com/\",
      \"UserIdentifier\": \"login\",
      \"Scopes\": \"read:user user:email\",
      \"OAuthAutoCreateUsers\": true,
      \"SSO\": true
    }
  }"

echo "OAuth SSO configured successfully!"