import { h, JSX } from 'preact';
import { BaseComponent, BaseProps } from '../base';
import { CSSDeclaration, TColumn } from '../../types';
export interface THProps extends BaseProps, JSX.HTMLAttributes<HTMLTableCellElement> {
    index: number;
    column: TColumn;
    style?: CSSDeclaration;
}
export interface THState {
    style: CSSDeclaration;
}
export declare class TH extends BaseComponent<THProps, THState> {
    private sortRef;
    private thRef;
    constructor(props: any, context: any);
    private isSortable;
    private isResizable;
    private onClick;
    private keyDown;
    componentDidMount(): void;
    private content;
    private getCustomAttributes;
    render(): h.JSX.Element;
}
