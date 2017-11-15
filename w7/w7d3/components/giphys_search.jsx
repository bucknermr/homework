import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.resetInput = this.resetInput.bind(this);
  }

  handleChange(event) {
    this.setState({ searchTerm: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    const { fetchSearchGiphys } = this.props;
    fetchSearchGiphys(this.state.searchTerm)
      .then(this.resetInput);
  }

  resetInput() {
    this.setState({ searchTerm: "" });
  }

  render() {
    return (
      <div>
        <form onChange={this.handleChange} onSubmit={this.handleSubmit} >
          <input type="text" value={this.state.searchTerm} />
          <input type="submit" value="Submit" />
        </form>

        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
