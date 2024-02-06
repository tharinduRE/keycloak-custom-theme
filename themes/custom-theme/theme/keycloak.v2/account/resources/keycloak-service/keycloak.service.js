function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return typeof key === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (typeof input !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (typeof res !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
/*
 * Copyright 2017 Red Hat, Inc. and/or its affiliates
 * and other contributors as indicated by the @author tags.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class KeycloakService {
  constructor(keycloak) {
    _defineProperty(this, "keycloakAuth", void 0);
    this.keycloakAuth = keycloak;
  }
  authenticated() {
    return this.keycloakAuth.authenticated ? this.keycloakAuth.authenticated : false;
  }
  audiencePresent() {
    if (this.keycloakAuth.tokenParsed) {
      const audience = this.keycloakAuth.tokenParsed['aud'];
      return audience === 'account' || Array.isArray(audience) && audience.indexOf('account') >= 0;
    }
    return false;
  }
  login(options) {
    this.keycloakAuth.login(options);
  }
  logout(redirectUri = baseUrl) {
    this.keycloakAuth.logout({
      redirectUri: redirectUri
    });
  }
  account() {
    this.keycloakAuth.accountManagement();
  }
  authServerUrl() {
    const authServerUrl = this.keycloakAuth.authServerUrl;
    return authServerUrl.charAt(authServerUrl.length - 1) === '/' ? authServerUrl : authServerUrl + '/';
  }
  realm() {
    return this.keycloakAuth.realm;
  }
  getToken() {
    return new Promise((resolve, reject) => {
      if (this.keycloakAuth.token) {
        this.keycloakAuth.updateToken(5).then(() => {
          resolve(this.keycloakAuth.token);
        }).catch(() => {
          reject('Failed to refresh token');
        });
      } else {
        reject('Not logged in');
      }
    });
  }
}
//# sourceMappingURL=keycloak.service.js.map