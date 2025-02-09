# swatchy2dot0's Home Assistant add-on repository

This repository tries to provide Home Assistant add-on which are not avaialble via other repositories (yet).

Add-on documentation: <https://developers.home-assistant.io/docs/add-ons>

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fswatchy2dot0%2Fhome-assistant-addons)

## Add-ons

This repository contains the following add-ons

### [SBFspot add-on](./sbfspot)

![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]

_SBFspot add-on to use as a blueprint for new add-ons._

<!--

Notes to developers after forking or using the github template feature:
- While developing comment out the 'image' key from 'sbfspot/config.yaml' to make the supervisor build the addon
  - Remember to put this back when pushing up your changes.
- When you merge to the 'main' branch of your repository a new build will be triggered.
  - Make sure you adjust the 'version' key in 'sbfspot/config.yaml' when you do that.
  - Make sure you update 'sbfspot/CHANGELOG.md' when you do that.
  - The first time this runs you might need to adjust the image configuration on github container registry to make it public
- Adjust the 'image' key in 'sbfspot/config.yaml' so it points to your username instead of 'home-assistant'.
  - This is where the build images will be published to.
- Rename the sbfspot directory.
  - The 'slug' key in 'sbfspot/config.yaml' should match the directory name.
- Adjust all keys/url's that points to 'home-assistant' to now point to your user/fork.
- Share your repository on the forums https://community.home-assistant.io/c/projects/9
- Do awesome stuff!
 -->

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
