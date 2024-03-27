""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# Avoid a load from @bazel_skylib repository as users don't necessarily have it installed
load("//third_party/github.com/bazelbuild/bazel-skylib/lib:versions.bzl", "versions")

_RULE_DEPS = [
    (
        "pypi__build",
        "https://files.pythonhosted.org/packages/4f/81/4849059526d02fcc9708e19346dd740e8b9edd2f0675ea7c38302d6729df/build-1.1.1-py3-none-any.whl",
        "8ed0851ee76e6e38adce47e4bee3b51c771d86c64cf578d0c2245567ee200e73",
    ),
    (
        "pypi__click",
        "https://files.pythonhosted.org/packages/76/0a/b6c5f311e32aeb3b406e03c079ade51e905ea630fc19d1262a46249c1c86/click-8.0.1-py3-none-any.whl",
        "fba402a4a47334742d782209a7c79bc448911afe1149d07bdabdf480b3e2f4b6",
    ),
    (
        "pypi__colorama",
        "https://files.pythonhosted.org/packages/44/98/5b86278fbbf250d239ae0ecb724f8572af1c91f4a11edf4d36a206189440/colorama-0.4.4-py2.py3-none-any.whl",
        "9f47eda37229f68eee03b24b9748937c7dc3868f906e8ba69fbcbdd3bc5dc3e2",
    ),
    (
        "pypi__installer",
        "https://files.pythonhosted.org/packages/e5/ca/1172b6638d52f2d6caa2dd262ec4c811ba59eee96d54a7701930726bce18/installer-0.7.0-py3-none-any.whl",
        "05d1933f0a5ba7d8d6296bb6d5018e7c94fa473ceb10cf198a92ccea19c27b53",
    ),
    (
        "pypi__packaging",
        "https://files.pythonhosted.org/packages/05/8e/8de486cbd03baba4deef4142bd643a3e7bbe954a784dc1bb17142572d127/packaging-21.3-py3-none-any.whl",
        "ef103e05f519cdc783ae24ea4e2e0f508a9c99b2d4969652eed6a2e1ea5bd522",
    ),
    (
        "pypi__pep517",
        "https://files.pythonhosted.org/packages/25/6e/ca4a5434eb0e502210f591b97537d322546e4833dcb4d470a48c375c5540/pep517-0.13.1-py3-none-any.whl",
        "31b206f67165b3536dd577c5c3f1518e8fbaf38cbc57efff8369a392feff1721",
    ),
    (
        "pypi__pip",
        "https://files.pythonhosted.org/packages/8a/6a/19e9fe04fca059ccf770861c7d5721ab4c2aebc539889e97c7977528a53b/pip-24.0-py3-none-any.whl",
        "ba0d021a166865d2265246961bec0152ff124de910c5cc39f1156ce3fa7c69dc",
    ),
    (
        "pypi__pip_tools",
        "https://files.pythonhosted.org/packages/0d/dc/38f4ce065e92c66f058ea7a368a9c5de4e702272b479c0992059f7693941/pip_tools-7.4.1-py3-none-any.whl",
        "4c690e5fbae2f21e87843e89c26191f0d9454f362d8acdbd695716493ec8b3a9",
    ),
    (
        "pypi__pyparsing",
        "https://files.pythonhosted.org/packages/6c/10/a7d0fa5baea8fe7b50f448ab742f26f52b80bfca85ac2be9d35cdd9a3246/pyparsing-3.0.9-py3-none-any.whl",
        "5026bae9a10eeaefb61dab2f09052b9f4307d44aee4eda64b309723d8d206bbc",
    ),
    (
        "pypi__setuptools",
        "https://files.pythonhosted.org/packages/92/e1/1c8bb3420105e70bdf357d57dd5567202b4ef8d27f810e98bb962d950834/setuptools-69.2.0-py3-none-any.whl",
        "c21c49fb1042386df081cb5d86759792ab89efca84cf114889191cd09aacc80c",
    ),
    (
        "pypi__tomli",
        "https://files.pythonhosted.org/packages/97/75/10a9ebee3fd790d20926a90a2547f0bf78f371b2f13aa822c759680ca7b9/tomli-2.0.1-py3-none-any.whl",
        "939de3e7a6161af0c887ef91b7d41a53e7c5a1ca976325f429cb46ea9bc30ecc",
    ),
    (
        "pypi__wheel",
        "https://files.pythonhosted.org/packages/7d/cd/d7460c9a869b16c3dd4e1e403cce337df165368c71d6af229a74699622ce/wheel-0.43.0-py3-none-any.whl",
        "55c570405f142630c6b9f72fe09d9b67cf1477fcf543ae5b8dcb1f5b7377da81",
    ),
    (
        "pypi__importlib_metadata",
        "https://files.pythonhosted.org/packages/d7/31/74dcb59a601b95fce3b0334e8fc9db758f78e43075f22aeb3677dfb19f4c/importlib_metadata-1.4.0-py2.py3-none-any.whl",
        "bdd9b7c397c273bcc9a11d6629a38487cd07154fa255a467bf704cd2c258e359",
    ),
    (
        "pypi__zipp",
        "https://files.pythonhosted.org/packages/f4/50/cc72c5bcd48f6e98219fc4a88a5227e9e28b81637a99c49feba1d51f4d50/zipp-1.0.0-py2.py3-none-any.whl",
        "8dda78f06bd1674bd8720df8a50bb47b6e1233c503a4eed8e7810686bde37656",
    ),
    (
        "pypi__more_itertools",
        "https://files.pythonhosted.org/packages/bd/3f/c4b3dbd315e248f84c388bd4a72b131a29f123ecacc37ffb2b3834546e42/more_itertools-8.13.0-py3-none-any.whl",
        "c5122bffc5f104d37c1626b8615b511f3427aa5389b94d61e5ef8236bfbc3ddb",
    ),
]

_GENERIC_WHEEL = """\
package(default_visibility = ["//visibility:public"])

load("@rules_python//python:defs.bzl", "py_library")

py_library(
    name = "lib",
    srcs = glob(["**/*.py"]),
    data = glob(["**/*"], exclude=["**/*.py", "**/* *", "BUILD", "WORKSPACE"]),
    # This makes this directory a top-level in the python import
    # search path for anything that depends on this.
    imports = ["."],
)
"""

# Collate all the repository names so they can be easily consumed
all_requirements = [name for (name, _, _) in _RULE_DEPS]

def requirement(pkg):
    return "@pypi__" + pkg + "//:lib"

def pip_install_dependencies():
    """
    Fetch dependencies these rules depend on. Workspaces that use the pip_install rule can call this.

    (However we call it from pip_install, making it optional for users to do so.)
    """

    # We only support Bazel LTS and rolling releases.
    # Give the user an obvious error to upgrade rather than some obscure missing symbol later.
    # It's not guaranteed that users call this function, but it's used by all the pip fetch
    # repository rules so it's likely that most users get the right error.
    versions.check("4.0.0")

    for (name, url, sha256) in _RULE_DEPS:
        maybe(
            http_archive,
            name,
            url = url,
            sha256 = sha256,
            type = "zip",
            build_file_content = _GENERIC_WHEEL,
        )
