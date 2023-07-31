import { h } from 'preact';
import Tabular from '../../tabular';
import { BaseComponent, BaseProps } from '../base';
import Header from '../../header';
import { Status } from '../../types';
interface TableProps extends BaseProps {
    data: Tabular;
    status: Status;
    header?: Header;
    width: string;
    height: string;
}
export declare class Table extends BaseComponent<TableProps> {
    render(): h.JSX.Element;
}
export {};
