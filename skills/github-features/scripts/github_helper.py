#!/usr/bin/env python3
import json
def github(): return {"features": ["prs", "issues", "actions", "projects"], "cli": ["gh"]}
if __name__ == "__main__": print(json.dumps(github(), indent=2))
