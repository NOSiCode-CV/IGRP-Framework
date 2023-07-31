import { Context } from 'preact';
import { Config } from '../config';
export default function getConfig(context: {
    [key: string]: Context<any>;
}): Config;
