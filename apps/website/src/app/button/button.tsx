import React from 'react';

/* eslint-disable-next-line */
export interface ButtonProps {}

export function Button(props: ButtonProps) {
  return (
    <div>
      <style jsx>{`
        div {
          color: pink;
        }
      `}</style>
      <h1>Welcome to button!</h1>
    </div>
  );
}

export default Button;
