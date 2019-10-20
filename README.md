# efficiency++

### I noticed few tasks are tedious like:

#### 1. Deleting all buckets from S3 at once?

  > ./remove_bucket <a_part_of_bucket_name>
  
  
"Deletion. When you make that decision, there's always that moment of hesitation. That annoying 'Are you sure?' dialogue box, and then you have to make a decision. Yes or no."

  
##### Example:
---------------------
> ./remove_bucket shitty
  ====================
  Delete that shitty bucket?
  ====================
  Are you sure?
---------------------

Press y or n to confirm individual buckets.
It asks before deleting each bucket.

