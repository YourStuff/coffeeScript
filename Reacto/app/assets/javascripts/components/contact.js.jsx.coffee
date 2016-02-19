class @Contact extends React.Component
  @propTypes =
    fname: React.PropTypes.string
    lname: React.PropTypes.string
    phone: React.PropTypes.string
    email: React.PropTypes.string
    street: React.PropTypes.string
    city: React.PropTypes.string
    state: React.PropTypes.string
    zip: React.PropTypes.string

  render: ->
    `<div>
      <div>Fname: {this.props.fname}</div>
      <div>Lname: {this.props.lname}</div>
      <div>Phone: {this.props.phone}</div>
      <div>Email: {this.props.email}</div>
      <div>Street: {this.props.street}</div>
      <div>City: {this.props.city}</div>
      <div>State: {this.props.state}</div>
      <div>Zip: {this.props.zip}</div>
    </div>`
