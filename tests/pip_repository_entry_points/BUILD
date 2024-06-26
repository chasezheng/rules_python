load("@pip_installed//:requirements.bzl", installed_entry_point = "entry_point")
load("@pip_parsed//:requirements.bzl", parsed_entry_point = "entry_point")
load("@rules_python//python:defs.bzl", "py_test")
load("@rules_python//python:pip.bzl", "compile_pip_requirements")

# This rule adds a convenient way to update the requirements file.
compile_pip_requirements(
    name = "requirements",
    extra_args = ["--allow-unsafe"],
)

pip_parsed_sphinx = parsed_entry_point(
    pkg = "sphinx",
    script = "sphinx-build",
)

pip_parsed_yamllint = parsed_entry_point("yamllint")

py_test(
    name = "pip_parse_entry_points_test",
    srcs = ["pip_repository_entry_points_test.py"],
    data = [
        pip_parsed_sphinx,
        pip_parsed_yamllint,
    ],
    env = {
        "SPHINX_BUILD_ENTRY_POINT": "$(rootpath {})".format(pip_parsed_sphinx),
        "YAMLLINT_ENTRY_POINT": "$(rootpath {})".format(pip_parsed_yamllint),
    },
    main = "pip_repository_entry_points_test.py",
    deps = ["@rules_python//python/runfiles"],
)

pip_installed_sphinx = installed_entry_point(
    pkg = "sphinx",
    script = "sphinx-build",
)

pip_installed_yamllint = installed_entry_point("yamllint")

py_test(
    name = "pip_install_annotations_test",
    srcs = ["pip_repository_entry_points_test.py"],
    data = [
        pip_installed_sphinx,
        pip_installed_yamllint,
    ],
    env = {
        "SPHINX_BUILD_ENTRY_POINT": "$(rootpath {})".format(pip_installed_sphinx),
        "YAMLLINT_ENTRY_POINT": "$(rootpath {})".format(pip_installed_yamllint),
    },
    main = "pip_repository_entry_points_test.py",
)
