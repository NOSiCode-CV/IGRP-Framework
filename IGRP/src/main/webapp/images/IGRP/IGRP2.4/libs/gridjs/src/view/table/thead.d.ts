import { h } from 'preact';
import { BaseComponent, BaseProps } from '../base';
import Header from '../../header';
interface THeadProps extends BaseProps {
    header: Header;
}
export declare class THead extends BaseComponent<THeadProps> {
    private renderColumn;
    private renderRow;
    private renderRows;
    render(): h.JSX.Element;
}
export {};
