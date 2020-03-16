Slurm Fair Share Policy
=======================

The cluster uses a fair share policy that is applied according to computational time (ie time is allocated fairly with all users having equal share).

When you submit your first job it'll go to the end of the queue, but the scheduler will quickly move it higher up the queue if other users with jobs running also have waiting jobs ahead of you in that queue. As you submit more jobs your usage figure will increase, so the scheduler becomes less generous. This means that users who submit less jobs will get a more rapid turnover, but the rapid turnaround of the first job may not be repeated for future jobs.

These rules apply to both interactive and sbatch jobs.
