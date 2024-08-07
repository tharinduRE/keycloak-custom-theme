# Keycloak Theme Customization

![Screenshot](docs/screenshot-1.png)

This repository contains a customized theme for Keycloak, an open-source identity and access management solution. The customized theme allows you to modify the look and feel of the Keycloak user interface to align with your branding and user experience requirements.

## Development

For local development, you can use Docker Compose to quickly spin up a Keycloak instance. This allows you to test your theme customizations without affecting your production environment.

To use Docker Compose:

1. Install Docker and Docker Compose on your machine.
2. Open a terminal and navigate to the repository's root directory.
3. Go the [releases](https://github.com/katanox/keycloak-custom-theme/releases) page in github and download the latest `katanox-theme.jar` and place in this repository inside a `providers` folder. The resulting structure should be `keycloak-custom-theme/providers/katanox-theme.jar`.
4. In the `docker-compose.yml` uncomment the providers and comment the line under `Development theme folder`.
5. Go to `/themes/custom-theme/theme/keycloak/common/resources` and run `yarn install --production`
6. Go to the root and run `./package.sh && docker-compose up`
7. Wait for the Keycloak container to start.
8. Access the Keycloak admin console by visiting `http://localhost:8080/auth/admin/`.
9. Log in using the default admin credentials (username: `admin`, password: `admin`).
10. Follow the steps mentioned in the "Installation" section to apply and test your customized theme.
11. Navigate to the `themes/custom-theme` folder.
12. Modify the template files (e.g., HTML, CSS) and resources (e.g., images) according to your branding and design requirements.
13. Update any necessary configurations or properties related to the theme customization.
14. Save your changes.
15. Kill the process in console and re-run `./package.sh && docker-compose up`

Note: If you make a ny changes you need to re-pack the theme and restart docker

## Building the Theme

To package the customized theme into a JAR file for use with Keycloak, you can use the provided shell script:

**NOTE**: When updating the theme jar, include the node modules in the packaged theme, otherwise they may not be picked up by Keycloak.
Alternatively, unzip the latest working release, copy all your changes into it and package it again.

1. Ensure you have Java and the `jar` command installed on your system.
2. Open a terminal and navigate to the repository's root directory.
3. Run the following command:

```sh
./package.sh
```

4. Follow the prompts to provide the JAR file name and confirm the customization.

Note: The name of the .jar file is `katanox-theme`.

The script will create a JAR file containing the customized theme and place it in the `providers` directory.

## Release process
1. Make required changes in the branch and commit them. Keep in mind that commit message is used to determine what part of version to bump.
- if commit message contains `[major]` substring - the magor version will be bumped (v0.0.0 -> v1.0.0)
- if commit message contains `[minor]` substring - the minor version will be bumped (v0.0.0 -> v0.1.0)
- if commit message contains `[patch]` substring - the patch version will be bumped (v0.0.0 -> v0.0.1)
- if no one of them in the commit message - the patch version will be bumped (v0.0.0 -> v0.0.1)

2. Go to circle ci and approve release of the new version.
- If the branch is non-master it will be a draft release (the tag will not be created and published in git)
- If the branch is a master branch it will be a normal release (git will create a tag and assosiate it with the release)

3. CircleCi pipeline will log the name of the release. Depending on the branch it could be `untagged_commitSHA` or `vX.X.X`. That needs to be copied
4. The next step is to go to kuberentes repository and apply changes using helm. More information here: https://www.notion.so/katadocs/Keycloak-themes-75bd6e0700954f49bc6f9f9f36638839?pvs=4

## Installation

To install and use the customized theme in Keycloak:

1. Start or restart the Keycloak server.
2. Log in to the Keycloak admin console.
3. Navigate to the desired realm.
4. Go to the "Realm Settings" > "Themes" section.
5. Select the customized theme from the available options for each desired theme (e.g., Login, Account, Admin).
6. Save the changes.

The customized theme will now be applied to the corresponding Keycloak pages.

## Documentation

- [Keycloak Documentation](https://www.keycloak.org/documentation)
- [Keycloak Theme Developer Guide](https://www.keycloak.org/docs/latest/server_development/#_themes)

## License

This repository is licensed under the [MIT License](LICENSE).
