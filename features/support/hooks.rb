Before do
  clean_screenshots
end

Before()do |scenario|
  @steps = []
  @step_count = 0
  case
    when !scenario.respond_to?('scenario_outline')
      @scenario_name = scenario.name
      if @scenario_name && !scenario.respond_to?('scenario_outline')
      scenario.source[1].send(:raw_steps).each do |step|
        @steps.push(step.name)
      end
      end
    when scenario.respond_to?('scenario_outline')
      @scenario_name = scenario.scenario_outline.name
      scenario.source[1].send(:steps).each do |step|
        @steps.push(step.name)
      end
  end
  launch_driver
end

AfterStep do |scenario|
  get_screenshot @scenario_name, @steps[@step_count]
  @step_count = @step_count + 1
end

After() do |scenario|
  if scenario.failed?
    get_screenshot @scenario_name, "Failed_" + @steps[@step_count]
  end
  quit_driver
end