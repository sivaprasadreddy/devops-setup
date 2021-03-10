gihubCredentialsId = 'github-credentials'
repos = [
  ['1234567890','vote-service', 'https://github.com/sivaprasadreddy/vote-service.git'],
  ['1234567891','bookmark-service', 'https://github.com/sivaprasadreddy/bookmark-service.git'],
  ['1234567892','bookmarks-ui', 'https://github.com/sivaprasadreddy/bookmarks-ui.git']
]

for (repo in repos) {
  multibranchPipelineJob(repo[1]) {
      branchSources {
          git {
              id(repo[0])
              remote(repo[2])
              credentialsId(gihubCredentialsId)
          }
      }
    triggers {
      periodicFolderTrigger {
        interval("15")
      }
    }
      orphanedItemStrategy {
          discardOldItems {
              daysToKeep(7)
              numToKeep(10)
          }
      }
  }
}