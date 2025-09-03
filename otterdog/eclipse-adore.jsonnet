local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.adore', 'eclipse-adore') {
  settings+: {
    description: "Eclipse ADORe is a ROS 2 toolkit for decision making, planning, control and simulation of automated vehicles supporting CARLA and SUMO.",
    name: "Eclipse ADORe project",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('adore') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "develop",
      delete_branch_on_merge: false,
      description: "Eclipse ADORe is a ROS 2 modular toolkit for decision making, planning, control and simulation of automated vehicles supporting CARLA and SUMO.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/docs",
      has_wiki: false,
      homepage: "https://eclipse-adore.github.io/adore/",
      topics+: [
        "automated-driving",
        "motion-planning",
        "ros",
        "simulation",
        "vehicle-communication",
        "vehicle-control",
        "vehicle-dynamics"
      ],
      merge_commit_message: "PR_BODY",
      merge_commit_title: "PR_TITLE",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      squash_merge_commit_message: "PR_BODY",
      squash_merge_commit_title: "PR_TITLE",
      web_commit_signoff_required: false,
      rulesets: [
        orgs.newRepoRuleset('develop') {
          allows_creations: true,
          enforcement: "disabled",
          include_refs+: [
            "refs/heads/develop",
            "~DEFAULT_BRANCH"
          ],
          required_status_checks: null,
          required_pull_request+: {
            required_approving_review_count: 1,
          },
        },
        orgs.newRepoRuleset('master branch protection') {
          allows_creations: true,
          include_refs+: [
            "refs/heads/develop",
            "~DEFAULT_BRANCH"
          ],
          required_status_checks: null,
          required_pull_request+: {
            required_approving_review_count: 1,
          },
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('adore_ROS1') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse ADORe is a ROS 1 based modular software library and toolkit for decision making, planning, control and simulation of automated vehicles supporting CARLA and SUMO.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/docs",
      homepage: "https://eclipse-adore.github.io/adore_ROS1/",
      topics+: [
        "automated-driving",
        "motion-planning",
        "ros",
        "simulation",
        "vehicle-communication",
        "vehicle-control",
        "vehicle-dynamics"
      ],
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('adore_cli') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "ros2",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "The ADORe CLI provides a Docker compose containerized ROS based development environment for the ADORe project leveraging GNU Make as a command runner",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}
