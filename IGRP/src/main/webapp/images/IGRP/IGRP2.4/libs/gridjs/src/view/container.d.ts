import { h } from 'preact';
import Tabular from '../tabular';
import { BaseComponent, BaseProps } from './base';
import { Status } from '../types';
import Pipeline from '../pipeline/pipeline';
import Header from '../header';
import { Config } from '../config';
interface ContainerProps extends BaseProps {
    config: Config;
    pipeline: Pipeline<Tabular>;
    header?: Header;
    width: string;
    height: string;
}
interface ContainerState {
    status: Status;
    header?: Header;
    data?: Tabular;
}
export declare class Container extends BaseComponent<ContainerProps, ContainerState> {
    private readonly configContext;
    private processPipelineFn;
    constructor(props: any, context: any);
    private processPipeline;
    componentDidMount(): Promise<void>;
    componentWillUnmount(): void;
    componentDidUpdate(_: Readonly<ContainerProps>, previousState: Readonly<ContainerState>): void;
    render(): h.JSX.Element;
}
export {};
