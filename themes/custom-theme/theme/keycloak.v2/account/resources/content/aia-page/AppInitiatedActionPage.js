function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return typeof key === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (typeof input !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (typeof res !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
/*
 * Copyright 2019 Red Hat, Inc. and/or its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import * as React from "../../../keycloak.v2/web_modules/react.js";
import { withRouter } from "../../../keycloak.v2/web_modules/react-router-dom.js";
import { AIACommand } from "../../util/AIACommand.js";
import { Msg } from "../../widgets/Msg.js";
import { Title, Button, EmptyState, EmptyStateVariant, EmptyStateIcon, EmptyStateBody, TitleSizes } from "../../../keycloak.v2/web_modules/@patternfly/react-core.js";
import { PassportIcon } from "../../../keycloak.v2/web_modules/@patternfly/react-icons.js";
import { KeycloakContext } from "../../keycloak-service/KeycloakContext.js";

// Note: This class demonstrates two features of the ContentPages framework:
// 1) The PageDef is available as a React property.
// 2) You can add additional custom properties to the PageDef.  In this case,
//    we add a value called kcAction in content.js and access it by extending the
//    PageDef interface.
// Extend RouteComponentProps to get access to router information such as
// the hash-routed path associated with this page.  See this.props.location.pathname
// as used below.
/**
 * @author Stan Silvert
 */
class ApplicationInitiatedActionPage extends React.Component {
  constructor(props) {
    super(props);
    _defineProperty(this, "handleClick", keycloak => {
      new AIACommand(keycloak, this.props.pageDef.kcAction).execute();
    });
  }
  render() {
    return /*#__PURE__*/React.createElement(EmptyState, {
      variant: EmptyStateVariant.full
    }, /*#__PURE__*/React.createElement(EmptyStateIcon, {
      icon: PassportIcon
    }), /*#__PURE__*/React.createElement(Title, {
      headingLevel: "h5",
      size: TitleSizes.lg
    }, /*#__PURE__*/React.createElement(Msg, {
      msgKey: this.props.pageDef.label,
      params: this.props.pageDef.labelParams
    })), /*#__PURE__*/React.createElement(EmptyStateBody, null, /*#__PURE__*/React.createElement(Msg, {
      msgKey: "actionRequiresIDP"
    })), /*#__PURE__*/React.createElement(KeycloakContext.Consumer, null, keycloak => /*#__PURE__*/React.createElement(Button, {
      variant: "primary",
      onClick: () => this.handleClick(keycloak),
      target: "_blank"
    }, /*#__PURE__*/React.createElement(Msg, {
      msgKey: "continue"
    }))));
  }
}
;

// Note that the class name is not exported above.  To get access to the router,
// we use withRouter() and export a different name.
export const AppInitiatedActionPage = withRouter(ApplicationInitiatedActionPage);
//# sourceMappingURL=AppInitiatedActionPage.js.map