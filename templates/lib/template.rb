require 'pipely/build'

class Template < Pipely::Build::Template

  DEFINITION_PATH = File.join(File.dirname(__FILE__), '..', 'templates', 'pipeline.json.erb')
  LOCAL_STEPS_PATH = File.join(File.dirname(__FILE__), '..', 'steps')

  def initialize
    super(File.read(DEFINITION_PATH))
  end

  def s3_step_path(filename)
    ensure_step_file_exists(filename)
    s3_step_prefix + filename
  end

private

  def s3n_step_path(path)
    if '/' == path[0]
      ensure_step_file_exists(path)
      s3n_step_prefix + path
    else
      path
    end
  end

  def ensure_step_file_exists(filename)
    full_path = File.join(LOCAL_STEPS_PATH, filename)
    raise "Missing step file: #{full_path}" unless File.exist?(full_path)
  end

end
