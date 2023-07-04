import { OneDArray, TColumn, TwoDArray } from './types';
import Base from './base';
import { Config, UserConfig } from './config';
import { ComponentChild } from 'preact';
declare class Header extends Base {
    private _columns;
    constructor();
    get columns(): OneDArray<TColumn>;
    set columns(columns: OneDArray<TColumn>);
    get visibleColumns(): OneDArray<TColumn>;
    adjustWidth(config: Config): this;
    private setSort;
    private setFixedHeader;
    private setResizable;
    private setID;
    private populatePlugins;
    static fromColumns(columns: OneDArray<TColumn | string | ComponentChild>): Header;
    static fromUserConfig(userConfig: UserConfig): Header | null;
    static fromHTMLTable(element: HTMLElement): Header;
    static tabularFormat(columns: OneDArray<TColumn>): TwoDArray<TColumn>;
    static leafColumns(columns: OneDArray<TColumn>): OneDArray<TColumn>;
    static maximumDepth(column: TColumn): number;
}
export default Header;
