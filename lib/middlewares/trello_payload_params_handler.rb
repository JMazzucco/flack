class TrelloPayloadParamsHandler
  def initialize(app)
    @app = app
  end

  def call(env)
    params = JSON.parse(env["rack.input"].gets)
    params["event"] = params["action"]
    params.delete("action")
    env["action_dispatch.request.request_parameters"] = params
    @app.call(env)
  end
end