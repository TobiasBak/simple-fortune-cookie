import requests
import yaml


def get_endpoint(endpoint_name: str) -> str:
    stream = requests.get(f"http://localhost:8080{endpoint_name}")
    return stream.text


def print_endpoint(endpoint_name: str):
    print("-" * 30 + endpoint_name + "-" * 30)
    print(get_endpoint(endpoint_name))
    print("\n")


def main():
    with open('functional_endpoints.yaml', 'r') as file:
        endpoints = yaml.safe_load(file)

    for endpoint in endpoints["endpoints"]:
        print_endpoint(endpoint)


if __name__ == '__main__':
    main()
