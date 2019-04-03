# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Issues
Issue.create(state: "open", title: SecureRandom.hex)
Issue.create(state: "closed", title: SecureRandom.hex)

# Create Pull Requests
Issue.create(state: "open", title: SecureRandom.hex, pull_request: PullRequest.create)
Issue.create(state: "open", title: SecureRandom.hex, pull_request: PullRequest.create(draft: true))
Issue.create(state: "closed", title: SecureRandom.hex, pull_request: PullRequest.create)
Issue.create(state: "closed", title: SecureRandom.hex, pull_request: PullRequest.create(merged_at: DateTime.now))
Issue.create(state: "closed", title: SecureRandom.hex, pull_request: PullRequest.create(draft: true))
