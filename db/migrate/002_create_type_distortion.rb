Sequel.migration do
  # TODO: Which Sequel methods create types? Using raw queries
  # is not optimal, but couldn't find right methods...
  up do
    run "CREATE TYPE distortion AS ( name varchar, intensity real[] )"
  end

  down do
  	run "DROP TYPE distortion"
  end

end

