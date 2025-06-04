FROM google/cloud-sdk:stable
COPY entrypoint.bash /entrypoint.bash
ENTRYPOINT ["bash", "/entrypoint.bash"]