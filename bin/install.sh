#!/bin/bash
mix archive.install hex mix_templates --force && \
mix archive.install hex mix_generator --force && \
mix template.install hex gen_template_template && \
mix template.install hex gen_template_project
