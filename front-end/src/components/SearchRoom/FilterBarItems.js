import React from "react";
import { Children } from "react";

export default function FilterBarItems(props) {
  return (
    <div className="filter-bar__content ">
      {Children.map(props.children, (child, i) => {
        let className = (props.active == i)
          ? "item bt__default active"
          : "item bt__default";
        //let style = (i === props.children.length - 1) ? { border: "none" } : {};
        return (
          <div
            className={className}
            //style={style}
            onClick={() => {
              props.onChange(child.key);
            }}
          >
            {child}
          </div>
        );
      })}
    </div>
  );
}
