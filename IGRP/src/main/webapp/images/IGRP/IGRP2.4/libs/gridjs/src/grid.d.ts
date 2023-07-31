import { Config, UserConfig } from './config';
import { VNode } from 'preact';
import { EventEmitter } from './util/eventEmitter';
import { GridEvents } from './events';
import { PluginManager } from './plugin';
declare class Grid extends EventEmitter<GridEvents> {
    config: Config;
    plugin: PluginManager;
    constructor(userConfig?: UserConfig);
    updateConfig(userConfig: Partial<UserConfig>): this;
    createElement(): VNode;
    forceRender(): this;
    render(container: Element): this;
}
export default Grid;
