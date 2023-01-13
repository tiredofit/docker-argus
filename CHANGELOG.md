## 1.2.3 2023-01-13 <dave at tiredofit dot ca>

   ### Added
      - Argus 0.11.1


## 1.2.2 2023-01-12 <dave at tiredofit dot ca>

   ### Changed
      - Fix for config watchdog


## 1.2.1 2023-01-11 <dave at tiredofit dot ca>

   ### Changed
      - Remove /build-assets from final container


## 1.2.0 2023-01-06 <dave at tiredofit dot ca>

   ### Added
      - Add build-assets directory for doing customizations upon building Dockerfile
      - Introduce custom_files capability to overlay files in filesystem upon container start
      - Introduce custom_scripts capability to execute scripts in container before process starts


## 1.1.0 2023-01-05 <dave at tiredofit dot ca>

   ### Added
      - Add RESTART_ON_CONFIG_CHANGE environment variable to detect configuration file changes

   ### Changed
      - Update examples
      - Change nginx reverse proxy configuration to better support HTTP 1.1 / WSS


## 1.0.0 2023-01-05 <dave at tiredofit dot ca>

   ### Added
      - Initial Release
      - Auto configuration Support
      - Argus 0.11.0
      - Nginx Reverse Proxy embedded for better authentication and options


