import { h, JSX } from 'preact';
import Cell from '../../cell';
import { BaseComponent, BaseProps } from '../base';
import { CSSDeclaration, TColumn } from '../../types';
import Row from '../../row';
export interface TDProps extends BaseProps, JSX.HTMLAttributes<HTMLTableCellElement> {
    cell: Cell;
    row?: Row;
    column?: TColumn;
    style?: CSSDeclaration;
    messageCell?: boolean;
}
export declare class TD extends BaseComponent<TDProps> {
    private content;
    private handleClick;
    private getCustomAttributes;
    render(): h.JSX.Element;
}
