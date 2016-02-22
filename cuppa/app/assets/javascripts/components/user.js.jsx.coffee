
# @cjsx React.DOM

{a, i, label, div, ul, li, input} = React.DOM

@User = React.createClass
  getInitialState: ->
    user: @props.user

  render: ->
    div {},
      p {
      id: @state.user.id,
      name: @state.user.name,
      email: @state.email}


