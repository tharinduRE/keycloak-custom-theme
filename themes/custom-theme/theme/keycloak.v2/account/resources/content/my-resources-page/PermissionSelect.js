function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return typeof key === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (typeof input !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (typeof res !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
import * as React from "../../../keycloak.v2/web_modules/react.js";
import { Select, SelectOption, SelectVariant } from "../../../keycloak.v2/web_modules/@patternfly/react-core.js";
import { Msg } from "../../widgets/Msg.js";
class ScopeValue {
  constructor(value) {
    _defineProperty(this, "value", void 0);
    this.value = value;
  }
  toString() {
    return this.value.displayName ? this.value.displayName : this.value.name;
  }
  compareTo(selectOption) {
    return selectOption.name === this.value.name;
  }
}
export class PermissionSelect extends React.Component {
  constructor(props) {
    super(props);
    _defineProperty(this, "onSelect", (event, value) => {
      const {
        selected
      } = this.state;
      const {
        onSelect
      } = this.props;
      if (!(value instanceof ScopeValue)) {
        return;
      }
      if (selected.includes(value)) {
        this.setState(prevState => ({
          selected: prevState.selected.filter(item => item !== value)
        }), () => onSelect(this.state.selected.map(sv => sv.value)));
      } else {
        this.setState(prevState => ({
          selected: [...prevState.selected, value]
        }), () => onSelect(this.state.selected.map(sv => sv.value)));
      }
    });
    _defineProperty(this, "onToggle", isExpanded => {
      this.setState({
        isExpanded
      });
    });
    _defineProperty(this, "clearSelection", () => {
      this.setState({
        selected: [],
        isExpanded: false
      });
      this.props.onSelect([]);
    });
    let values = [];
    if (this.props.selected) {
      values = this.props.selected.map(s => new ScopeValue(s));
    }
    this.state = {
      isExpanded: false,
      selected: values,
      scopes: this.props.scopes.map((option, index) => /*#__PURE__*/React.createElement(SelectOption, {
        key: index,
        value: values.find(s => s.compareTo(option)) || new ScopeValue(option)
      }))
    };
  }
  render() {
    const {
      isExpanded,
      selected
    } = this.state;
    const titleId = 'permission-id';
    return /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement("span", {
      id: titleId,
      hidden: true
    }, /*#__PURE__*/React.createElement(Msg, {
      msgKey: "selectPermissions"
    })), /*#__PURE__*/React.createElement(Select, {
      maxHeight: 300,
      direction: this.props.direction || 'down',
      variant: SelectVariant.typeaheadMulti,
      typeAheadAriaLabel: Msg.localize("selectPermissions"),
      onToggle: this.onToggle,
      onSelect: this.onSelect,
      onClear: this.clearSelection,
      selections: selected,
      isOpen: isExpanded,
      "aria-labelledby": titleId,
      placeholderText: Msg.localize("selectPermissions"),
      menuAppendTo: "parent"
    }, this.state.scopes));
  }
}
//# sourceMappingURL=PermissionSelect.js.map