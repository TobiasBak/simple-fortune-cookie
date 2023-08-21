import sys

import requests
import yaml


def get_endpoint(endpoint_name: str) -> str:
    stream = requests.get(f"http://localhost:8080{endpoint_name}")
    if not stream.ok:
        raise Exception(f"The endpoint: {endpoint_name} is not available", stream)
    return stream.text


def print_endpoint(endpoint_name: str):
    print("-" * 30 + endpoint_name + "-" * 30)
    print(get_endpoint(endpoint_name))
    print("\n")


def main():
    with open('functional_endpoints.yaml', 'r') as file:
        endpoints = yaml.safe_load(file)

    errors = []

    for endpoint in endpoints["endpoints"]:
        try:
            print_endpoint(endpoint)
        except Exception as e:
            errors.append(e)

    if len(errors) > 0:
        print(f"Some endpoints caused errors: {errors}", file=sys.stderr)
        exit(1)

if __name__ == '__main__':
    main()
