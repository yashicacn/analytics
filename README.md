# analytics
dbt analytics
Identity: I am using user_pseudo_id to track unique individuals.

Window: My current models look at the entire 5-day sample period.

Tie-breaking: If a user has two clicks at the exact same microsecond, ROW_NUMBER() picks one arbitrarily. (In a real job, you might use an extra ID to break ties).
