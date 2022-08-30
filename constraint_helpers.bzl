"""Helper methods for common OS constraints. Please add more helper methods as needed"""

def has_macos_constraint(ctx):
    """
    Helper method for checking to see if a target is being built for MacOS.

    This must be used in conjunction with adding the MacOS constraint to the
    rule attributes.

    Usage:
    ```
    load("@bazel_platforms:constraint_helpers.bzl", "macos_constraint", "has_macos_constraint")
    load("@bazel_skylib/lib:dicts.bzl", "dicts")

    my_rule = rule(
        # Add the macos constraint to the rule attrs
        attrs = dicts.add({"some_attr": "value"}, macos_constraint)
    )

    def _my_rule_impl(ctx):
        if has_macos_constraint(ctx):
            # do something

    ```

    Args:
      ctx: The rule context

    Returns:
      A boolean indicating whether the target is being built for MacOS.
    """
    return ctx.target_platform_has_constraint(ctx.attr._macos_constraint[platform_common.ConstraintValueInfo])

macos_constraint = {"_macos_constraint": attr.label(default = "@bazel_platforms/os:macos")}
