import { h } from 'preact';
import Tabular from '../../tabular';
import { BaseComponent, BaseProps } from '../base';
import { Status } from '../../types';
import Header from '../../header';
interface TBodyProps extends BaseProps {
    data: Tabular;
    status: Status;
    header?: Header;
}
export declare class TBody extends BaseComponent<TBodyProps> {
    private headerLength;
    render(): h.JSX.Element;
}
export {};
