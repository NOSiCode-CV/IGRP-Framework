import { Config } from '../config';
import Pipeline from './pipeline';
import Tabular from '../tabular';
declare class PipelineUtils {
    static createFromConfig(config: Config): Pipeline<Tabular>;
}
export default PipelineUtils;
