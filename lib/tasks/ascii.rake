namespace :ascii do
  task print_art: :environment do
    puts <<-'EOF'
      | |__ (_)   |  _ \ __ _(_)_ __(_)_ __
      | '_ \| |   | |_) / _` | | '__| | '_ \
      | | | | |   |  __/ (_| | | |  | | | | |
      |_| |_|_|   |_|   \__,_|_|_|  |_|_| |_|
    EOF
  end
end