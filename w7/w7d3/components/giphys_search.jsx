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
    this.setState({ searchTerm: event.value });
  }

  handleSubmit(event) {
    const { fetchSearchGiphys } = this.props;
    event.preventDefault();
    fetchSearchGiphys(event.value)
      .then(this.resetInput);
  }

  resetInput() {
    this.setState({ searchTerm: "" });
  }

  render() {
    // const { handleChange, handleSubmit } = this.props;
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
