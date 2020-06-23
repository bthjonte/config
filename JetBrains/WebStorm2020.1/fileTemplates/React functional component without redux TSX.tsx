import React from 'react';
import { makeStyles, Theme } from '@material-ui/core';


interface Props {
}

const useStyles = makeStyles((theme: Theme) => ({
    content: {
    },
}));

const $fileNameWithoutExtension: React.FunctionComponent<Props> = () => {
    const classes = useStyles();
    return (
        <div className={classes.content}>

        </div>
    );
};


export default $fileNameWithoutExtension;