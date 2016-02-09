TrainerPlugin::Engine.routes.draw do
  scope module: "api" do
    post "user_stats" => "stats#user_stats"
    post "user_clicks" => "stats#user_clicks"
    get "summ_act" => "stats#activity_summary"
    get "summ_click" => "stats#clicks_summary"
    get "/" => "reports#main"
  end
end
