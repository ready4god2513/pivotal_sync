# PivotalSync

Pull from the [Pivotal Tracker V4 API](https://www.pivotaltracker.com/help/api?version=v4).
Gives access to projects, iterations, stories, memberships, attachments, comments, tasks and integrations.

### Mappings

#### Project
    id, Integer
    name, String
    created_at, DateTime
    version, Integer
    iteration_length, Integer
    week_start_day, String
    point_scale, String
    account, String
    first_iteration_start_time, DateTime
    current_iteration_number, Integer
    enable_tasks, Boolean
    velocity_scheme, String
    current_velocity, Integer
    initial_velocity, Integer
    number_of_done_iterations_to_show, Integer
    labels, String
    allow_attachments, Boolean
    public, Boolean
    use_https, Boolean
    bugs_and_chores_are_estimatable, Boolean
    comit_mode, Boolean
    last_activity_at, DateTime

#### Iteration
    id, Integer
    number, Integer
    start, DateTime
    finish, DateTime
    team_strength, Float

#### Story
    id, Integer
    project_id, Integer
    story_type, String
    url, String
    estimate, Float
    current_state, String
    description, String
    name, String
    created_at, DateTime
    updated_at, DateTime
    accepted_at, DateTime
    labels, String
    
#### Task
    id, Integer
    description, String
    position, Integer
    complete, Boolean
    created_at, DateTime

#### Comment
    id, Integer
    text, String
    created_at, DateTime

#### Integration
    id, Integer
    type, String
    name, String
    field_name, String
    field_label, String
    active, Boolean 

#### Attachment
    id, Integer
    filename, String
    url, String
    uploaded_at, DateTime
    
#### Membership
    id, Integer
    role, String
    user_id, Integer
    name, String
    email, String
    initials, String
    
#### Person
    id, Integer
    email, String
    name, String
    initials, String

### Associations

    project has_many :iterations
    project has_many :stories, through: :iterations
    iteration has_many :stories
    story belongs_to :project
    story has_many :attachments
    story has_many :tasks
    story has_many :comments
    
    attachment has_one :uploaded_by (Person)
    comment has_one :author (Person)
    story has_one :owned_by (Person)
    story has_one :requested_by (Person)
    
## Installation

Add this line to your application's Gemfile:

    gem "pivotal_sync"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pivotal_sync

## Usage

    PivotalSync::Client.token = "your token"
    projects = PivotalSync::Project.all

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
