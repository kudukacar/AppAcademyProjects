import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from './bench_index';

const Search = (props) => {
      return (
      <div>
          <BenchMap/>
          <BenchIndex { props }/>
        </div>
    )
}

export default Search;