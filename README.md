# Clasp Action

This action uses [clasp](https://github.com/google/clasp) to push or deploy to [Google Apps Script](https://developers.google.com/apps-script/). This action is running `clasp push -f` regardless of whether you select `push` or `deploy` as the command. This will force the remote manifest to be overwritten. This action is using [clasp v 2.5.0](https://www.npmjs.com/package/@google/clasp/v/2.5.0).

## Inputs

### `accessToken`

**Required** `access_token` written in `.clasprc.json`.

### `idToken`

**Required** `id_token` written in `.clasprc.json`.

### `refreshToken`

**Required** `refresh_token` written in `.clasprc.json`.

### `clientId`

**Required** `clientId` written in `.clasprc.json`.

### `clientSecret`

**Required** `clientSecret` written in `.clasprc.json`.

### `scriptId`

**Required** `scriptId` written in `.clasp.json`.

### `rootDir`

Directory where scripts are stored.

### `command`

**Required** Command to execute(`push` or `deploy`).

If `deploy` is selected, this action is running `clasp push -f` just before.

Deploy works for max. 20 deployments due to Gas limit on active deployments and complexity to determine which deployment should be deleted.
Workaround : Set deployId.

### `description`

Description of the deployment.

### `deployId`

Deploy ID that will be updated with this push.

## Example usage

### Case to push

```yaml
- uses: joejansen/clasp-action@v1.2
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    command: "push"
```

### Case to deploy

```yaml
- uses: joejansen/clasp-action@v1.2
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    command: "deploy"
```

### Case to deploy with description

```yaml
- uses: joejansen/clasp-action@v1.2
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    command: "deploy"
    description: "Sample description"
```

### Case to specify the directory where scripts are stored

```yaml
- uses: joejansen/clasp-action@v1.2
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    rootDir: "src"
    command: "push"
```

### Case to update a specific deploy

```yaml
- uses: joejansen/clasp-action@v1.2
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    command: "deploy"
    deployId: ${{ secrets.DEPLOY_ID }}
```

## License summary

This code is made available under the MIT license.
