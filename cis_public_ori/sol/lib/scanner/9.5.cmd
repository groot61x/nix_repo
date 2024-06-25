# It is important to ensure that system files and directories are maintained 
# with the permissions they were intended to have from the OS vendor (Oracle).
# Errors may be a simple reflection of changes made earlier in this benchmark, such as alteration of the ownership of 
# the cron process, so this result indicates that pkg verify is doing its job and detecting file changes.

a=$(pkg verify)

echo "$a"
