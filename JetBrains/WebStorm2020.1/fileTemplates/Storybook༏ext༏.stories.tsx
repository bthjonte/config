import {storiesOf} from "@storybook/react";
import StyledBase from "../../../theme/StyledBase";
import * as React from "react";

storiesOf('$of', module)
    .addDecorator(storyFn => <StyledBase>{storyFn()}</StyledBase>)
    .add('$story', () => (
        <$component>

        </$component>
    ));