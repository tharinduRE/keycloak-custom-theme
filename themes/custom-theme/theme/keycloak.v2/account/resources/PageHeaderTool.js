function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return typeof key === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (typeof input !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (typeof res !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
import * as React from "../keycloak.v2/web_modules/react.js";
import { PageHeaderTools } from "../keycloak.v2/web_modules/@patternfly/react-core.js";
import { ReferrerLink } from "./widgets/ReferrerLink.js";
import { LogoutButton } from "./widgets/Logout.js";
export class PageHeaderTool extends React.Component {
  constructor(...args) {
    super(...args);
    _defineProperty(this, "hasReferrer", typeof referrerName !== 'undefined');
  }
  render() {
    const username = loggedInUserName();
    return /*#__PURE__*/React.createElement(PageHeaderTools, null, this.hasReferrer && /*#__PURE__*/React.createElement("div", {
      className: "pf-c-page__header-tools-group"
    }, /*#__PURE__*/React.createElement(ReferrerLink, null)), /*#__PURE__*/React.createElement("div", {
      className: "pf-c-page__header-tools-group"
    }, /*#__PURE__*/React.createElement(LogoutButton, null)), /*#__PURE__*/React.createElement("span", {
      style: {
        marginLeft: '10px'
      },
      id: "loggedInUser"
    }, username));
  }
}
//# sourceMappingURL=PageHeaderTool.js.map