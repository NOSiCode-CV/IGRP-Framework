import { h } from 'preact';
import Row from '../../row';
import { BaseComponent, BaseProps } from '../base';
import Header from '../../header';
export interface TRProps extends BaseProps {
    row?: Row;
    header?: Header;
    messageRow?: boolean;
}
export declare class TR extends BaseComponent<TRProps> {
    private getColumn;
    private handleClick;
    private getChildren;
    render(): h.JSX.Element;
}
