import React from 'react';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
    componentDidMount() {
        this.props.fetchBenches();
    }

    render() {
        const bench = this.props.benches.map(bench => <BenchIndexItem key={bench.id} bench={bench}/>);

        return(
            <ul>{bench}</ul>
        )

    }
}

export default BenchIndex;