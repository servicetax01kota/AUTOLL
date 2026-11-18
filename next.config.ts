import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // The SQLite driver ships native binaries; keep it out of the bundle.
  serverExternalPackages: ["@libsql/client", "libsql"],
};

export default nextConfig;
