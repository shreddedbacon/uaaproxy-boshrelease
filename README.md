# UAAProxy BOSH Release

This is a BOSH release that deploys a UAA transport proxy for GitLab OAuth for use with MatterMost

It is a combination of parts from both of these projects:
* https://github.com/cloudfoundry-community/mattermost-cf-integrator
* https://github.com/ArthurHlt/uaa-proxifier

# Deploy
```
bosh -d uaaproxy d manifests/uaaproxy.yml \
  -o manifests/operations/mattermost.yml
```

## TODO
* allow uaa-proxifier to start with https instead of http

## MatterMost GitLabSettings
Unfortunately, mattermost gitlab oauth doesn't allow for insecure certificates. So you need to add the CA for UAA and/or UAAProxy to the mattermost host somehow
```
    properties:
      mattermost:
        GitLabSettings:
          Enable: true
          Secret: adminsecret
          Id: mattermost
          Scope: openid
          AuthEndpoint: https://uaa.service.cf.internal:8443/oauth/authorize #UAA url
          TokenEndpoint: https://uaa.service.cf.internal:8443/oauth/token #UAA url
          UserApiEndpoint: http://<host-or-ip-of-uaaproxy:port>/userinfo
```
